function BIDS_tool()

%----------------------------------------------------------------------------------
% tool to auto-correct errors in BIDS data. (structure/syntax/convention)
%----------------------------------------------------------------------------------

    % pointme at the top-level bids directory
    directory = '/Users/andrewweng/Data/ds000107';
    listContents(directory);
    jsonFiles = (trackJson(directory));
    fixJson(jsonFiles);
    disp('done')
end


%------------------------------------------------------------------------
% returns all non-dotfiles in the data directory
%------------------------------------------------------------------------

function listContents(rootDirectory)
    folderInfo = dir(rootDirectory);
    for index = 1:numel(folderInfo)
        if(folderInfo(index).name ~= "." && folderInfo(index).name ~= "..")
            a = folderInfo(index).name;
            disp(folderInfo(index).name);
        end
    end
end


%------------------------------------------------------------------------
% returns a struct with all .json files
%------------------------------------------------------------------------

function jsonFiles = trackJson(rootDirectory)
    filePattern = fullfile (rootDirectory, '*.json');
    jsonFiles = dir(filePattern);
   
end


%------------------------------------------------------------------------
% fixes JSON files
%------------------------------------------------------------------------

function fixJson(jsonFiles)

    
    for i = 1:numel(jsonFiles)
        
        %displays contents of json files
        disp(jsonFiles(i).name);
        currentFilename = jsonFiles(i).name;
        currentFile = fopen(currentFilename);
        raw = fread(currentFile);
        chars = char(raw);
   
        dirtyStr = convertCharsToStrings(chars);
        disp(dirtyStr);
        currentFilenameStr = string(currentFilename);
    
        cleanedStr = spaceToUnderscore(dirtyStr);
        if(currentFilenameStr ~= 'dataset_description.json')
            cleanedStr = spaceToUnderscore(dirtyStr);
        else
            cleanedStr = dirtyStr;
        end
        
        disp(cleanedStr);
        
        
        
  
    
    end
    
        
        
        
end



%------------------------------------------------------------------------
% converts spaces in strings to underscores and returns the cleaned string
%------------------------------------------------------------------------
    
function cleanedStr = spaceToUnderscore(dirtyStr)
    cleanedStr = strrep(dirtyStr," ",'');
end


    

