Project Title: Fifteen Puzzle

Author:
Stephen Brown
stephen.p.brown@wsu.edu
11466405

Fifteen Puzzle:
This project involved utilizing IB and the model-view-matrix paradigm to create a fifteen tiled puzzle.
For IB, I used auto-layout using contraints in order to keep the background and puzzle views centered,
and the tiles are placed programmatically. 

Description:
The puzzle is a 4x4 grid, and has 15 tiles, where 1 of the 16 is an empty slot. The user then moves the
tiles around with the empty space and tries to get the numbers in order from left to right and top to bottom.
Once the tiles are in order, the puzzle is solved! The user can also hit the "shuffle" button in order to
shuffle the tiles in a solvable way. The app also has data persistence, to make sure when you reload into the
game it will resume from where you left off.

Build/Run Info:
1.  Choose a directory to clone repository into
2.  run "git clone git@gitlab.encs.vancouver.wsu.edu:aerologic/FifteenPuzzle.git" in terminal
3.  Open Xcode and navigate to the project using file->open
4.  Once project loads into Xcode, hit the "play/build" button in the upper left cornerin order to build and run the program.
(NOTE: If using the encs lab computers, make sure to run /etc/devme, /etc/homeme, and /etc/simme in order to use
the similators within Xcode)
5.  Project will load after a successful build and will be usable within the Xcode similator