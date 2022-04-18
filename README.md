This repository contains the scripts we'll be using for the Geospatial Workshop Part 3: Introduction to Geospatial Raster and Vector Data with R, on April 19th, 2022. 

### Folders
#### Completed
The Completed folder contains completed scripts used during the lesson's episodes for reference by the instructor and learners. Note that some of the code has been changed from the original content for the [Introduction to Geospatial Raster and Vector Data](https://datacarpentry.org/r-raster-vector-geospatial/) lesson.

#### Working
The Working folder contains just the comments from the completed scripts, to guide the instructor and learners in live-coding from the [Introduction to Geospatial Raster and Vector Data](https://datacarpentry.org/r-raster-vector-geospatial/) lesson.

### Recommended Setup
I recommend learners follow the steps in the [Project Management with RStudio](https://datacarpentry.org/r-intro-geospatial/02-project-intro/index.html) episode of the [Introduction to R for Geospatial Data](https://datacarpentry.org/r-intro-geospatial/) lesson to set up their R project and directory folders, especially:
- The steps under "Challenge: Creating a self-contained project" to create a new project and directory called `r-geospatial`.
- The steps under "Tip: Good Enough Practices for Scientific Computing" to create the folders: `doc`,`data`,`results`,`src`, and `bin` within `r-geospatial`.

### Using these scripts in RStudio
Although you can just download these scripts and import them into RStudio manually, I recommend learners follow the recommended setup steps above, then download this repository as a zipped folder. Unzip the folder into the `src` folder in your `r-geospatial` repository. You may need to move files out into the `src` folder from the `r-geospatial-main` folder (then delete `r-geospatial-main`). 

### Pointing the scripts to your data files
Note that the data files used with these scripts are located directly in the `data` repository/folder created in the recommended setup steps above. When you unzip the data files as instructed in the [workshop setup instructions](https://datacarpentry.org/geospatial-workshop/setup.html), it may add an extra folder (`2009586`). You can either move the data files out into the `data` folder and then delete the now empty `2009586` folder, or change the filepath in the scripts to match the actual filepath to your data files (for example by appending `2009586/` after `data/`).
