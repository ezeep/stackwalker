Stackwalker
===========

This is a standalone fork of Mozilla Socorro's minidump stackwalker. The original code is available at https://github.com/mozilla/socorro/tree/master/minidump-stackwalk. We're trying to keep this unlinked fork updated and close to the original code.

The purpose of this fork is to easily add it as a dependency to your own project. At ezeep for example we use a custom Breakpad crash collector and just wanted to make use of Mozilla's stackwalker to generate a clean JSON output from the received dumps for further processing.
