# Vid2ANN
Annotation of text (lexicon words) in images

## Dependency
Tested on Matlab v2013a

## Input Data
1. Image Folder: containing .png files (For other image formats, please modify the file extension in the source code PickFrames.m)
2. Query File: containing the list of query text (lexicon words) along with the folder name. <br>
   \<foldername\> lexicon1<br>
   \<foldername\> lexicon2<br>
   ...<br>
   Sample query file is shown here.
    1_1 light
    1_1 optical
    1_1 rays
    1_1 frequency
    1_2 rendering

## Run
1. Run matlab executable with graphics interface.
2. Call PickFrames()
3. Use file picker to choose query file and image folder.
4. Start Annotation<br>
  4.1 The images from the folder will be displayed iteratively.<br>
  4.2 Click NewWord button, choose the lexicon word from the Select Query interface and then draw a rectangle around the word and double click to annotate.<br>
  4.3 Press Next/Previous to move forward and backward in image list.<br>
5. The annotated file along with cordinates would be present in the Image Folder under the name ImageFolder_Meta.txt
  5.1 The annoatation file format is as follows:-<br>
      \<word_id\> \<Image_Folder>\ \<Image_File_Name\> <occStatus> <inflectStatus> xmin ymin width height \<lexicon_word\><br>
      Here occStatus means whether the word is occluded or not {0-No;1-Partial;2-Major}<br>
      and inflectStatus means whether the word is language inflection of the lexicon word. For example lexicon word run could have an inflection with ran, running, runs etc. {0-No;1-Yes}<br>
