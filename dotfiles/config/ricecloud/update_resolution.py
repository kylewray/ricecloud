import sys
import os
import os.path
import subprocess
import argparse

from configparser import ConfigParser
from time import sleep


class UpdateResolution(object):
    """ A helpful little class to load a config file and call xrandr properly. """

    def __init__(self):
        """ The constructor for the UpdateResolution class. """

        self._config = dict()
        self._edids = set()

    def load_config(self):
        """ Attempt to load "~/.config/ricecloud/config". """

        # Parse the config file and return an error if it failed.
        config = ConfigParser()
        filename = os.path.join(os.path.expanduser("~"), ".config",
                                "ricecloud", "config")

        try:
            config.read(filename)
        except:
            sys.stderr("Failed to load configuration file '%s'." % (filename))
            sys.exit(1)

        self._config = dict()

        # For each section, we determine how many monitors there are.
        try:
            for sectionName in config.sections():
                # Convert to a dictionary.
                configDict = dict()
                for key, value in config.items(sectionName):
                    configDict[key] = value

                # Get all the EDID information in an array instead.
                numDisplays = int(configDict['numdisplays'])
                configDict['sectionname'] = sectionName
                configDict['edids'] = {configDict['edid' + str(i)] for i in range(numDisplays)}

                # Ensure the list exists for this specific number of displays.
                try:
                    self._config[numDisplays]
                except:
                    self._config[numDisplays] = list()

                # Create the mapping from a number of displays to a list of
                # viable monitor assignments.
                self._config[numDisplays] += [configDict]

        except:
            sys.stderr("Failed to parse the configuration file '%s'." % (filename))
            sys.exit()

    def parse_display_info(self):
        """ Use xrandr to parse the displays and their EDIDs.

            Returns:
                True if the display info changed since last time; False otherwise.
        """

        # Store the old version and clear the new one.
        previousEDIDs = self._edids.copy()
        self._edids = set()

        # First, attempt to call xrandr. Split the output into lines.
        try:
            result = subprocess.check_output(["xrandr", "--prop"])
        except:
            sys.stderr("Failed to get display information from 'xrandr'.")
            sys.exit(1)

        lines = result.decode("ascii").split("\n")

        # For each line, search for "EDID:". If found, concatenate all successor lines
        # until there is a line break.
        concatenating = False
        currentEDID = None

        for line in lines:
            if concatenating:
                # We add the current line to the EDID if it is indented twice.
                # Otherwise, we have arrived at a line; we add it to the dict.
                if line[0:2] == "\t\t":
                    currentEDID += line.strip()
                else:
                    self._edids |= {currentEDID}
                    concatenating = False
            else:
                # Continue to look for the keywork "\tEDID: " on the line.
                if line == "\tEDID: ":
                    currentEDID = ""
                    concatenating = True

        return previousEDIDs != self._edids

    def apply_display_config(self):
        """ Apply the display configuration given the display information retrieved. """

        numDisplays = len(self._edids)

        try:
            for config in self._config[numDisplays]:
                # If we find a configuration section that matches the current EDIDs,
                # then apply the script and return.
                edids = set(config['edids'])

                if len(self._edids - edids) == 0 and len(edids - self._edids) == 0:
                    updateScriptFilename = os.path.join(os.path.dirname(os.path.realpath(__file__)), "update_resolution.sh")
                    result = subprocess.check_output([updateScriptFilename, config['enabled'], config['disabled'],
                                                      config['width'], config['height'], config['refreshrate']])
                    return

            # If we did not find a match, return an exception.
            raise Exception()
        except:
            sys.stderr("Failed to apply display configuration.")
            sys.exit(1)

    def run(self, numIterations=None, waitTimeBetweenUpdates=3.0):
        """ Run the main loop of UpdateResolution. Optionally, specify the number of iterations and wait time.

            Parameters:
                numIterations           --  Number of steps, invalid implies infinite. Default is None == 1.
                waitTimeBetweenUpdates  --  The time (in seconds) to wait between updates. Default is 5.
        """

        if numIterations is None:
            numIterations = 1
            waitTimeBetweenUpdates = 1.0

        elif (type(waitTimeBetweenUpdates) != int \
                and type(waitTimeBetweenUpdates) != float) \
                or waitTimeBetweenUpdates <= 0.0:
            waitTimeBetweenUpdates = 5.0

        running = True
        counter = 0

        while running:
            if self.parse_display_info():
                self.apply_display_config()

                print("----------------------------------------------------")
                self.print_config_info()
                self.print_display_info()
                print("----------------------------------------------------")

            if type(numIterations) == int and numIterations > 0:
                counter += 1
                if counter >= numIterations:
                    running = False

            sleep(waitTimeBetweenUpdates)

    def print_config_info(self):
        """ Print the configuration information loaded from the config file. """

        print("CONFIGURATION INFORMATION")
        for numDisplays, value in self._config.items():
            print("Num Displays: %i" % (numDisplays))
            print()
            for config in self._config[numDisplays]:
                print("Section Name: %s" % (config['sectionname']))
                print("EDIDs: %s" % (config['edids']))
                print("Enabled: %s" % (config['enabled']))
                print("Disabled: %s" % (config['disabled']))
                print("RefershRate: %s" % (config['refreshrate']))
                print()

    def print_display_info(self):
        """ Print the display information used in the configuration. """

        print("DISPLAY INFORMATION")
        for edid in self._edids:
            print("EDID: %s" % (edid))
            print()


if __name__ == "__main__":
    # TODO: Load these also from the config, and have the flags override the config.
    parser = argparse.ArgumentParser()
    parser.add_argument("-n", "--numIterations", type=int, action="store",
                        help="number of iterations of update resolution's check")
    parser.add_argument("-t", "--waitTimeBetweenUpdates", type=float, action="store",
                        help="wait time (in seconds) between updates")
    args = parser.parse_args()

    n = None
    try:
        n = int(args.numIterations)
    except TypeError:
        pass

    t = None
    try:
        t = float(args.waitTimeBetweenUpdates)
    except TypeError:
        pass

    updateResolution = UpdateResolution()
    updateResolution.load_config()
    updateResolution.run(numIterations=n, waitTimeBetweenUpdates=t)

