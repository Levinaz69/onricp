%% Meta list
baseDir = 'data/2017-12/';
patchList = {'head2', 'legs2', 'larm', 'rarm', 'lfoot', 'rfoot','left_hand','right_hand'};
modelList = {'0093'};

%% Generate List
subDirNameList = {};
workPathList = {};
sourceNameList = {};
targetNameList = {};
for model = modelList
    for patch = patchList
        subDirNameList = [subDirNameList, patch];
        workPathList = [workPathList, fullfile(baseDir, model)];
        sourceNameList = [sourceNameList, 'template'];
        targetNameList = [targetNameList, 'target'];
    end
end

for dirIndex = 1:length(subDirNameList)

    subDirName = subDirNameList{dirIndex};
    workPath = workPathList{dirIndex};
    sourceName = sourceNameList{dirIndex};
    targetName = targetNameList{dirIndex};


    %% Set file paths
    basePath = pwd;
    subDirPath = strcat(workPath, '/', subDirName);

    outputPath = strcat(workPath, '/OUTPUT/');
    if exist(outputPath, 'dir') ~= 7
        mkdir(outputPath);
    end

    sourceFile = strcat(subDirPath, '/', sourceName, '.ply');
    % targetFile = strcat(subDirPath, '/', targetName, '.ply');
    targetFile = strcat(subDirPath, '/../', targetName, '.ply');

    sourceMarker = strcat(subDirPath, '/', sourceName, '_markers.xyz');
    targetMarker = strcat(subDirPath, '/', targetName, '_markers.xyz');

    sourceTransName = strcat(sourceName, '_transformed');
    sourceMarkerTransName = strcat(sourceName, '_markers_transformed');
    sourceFileTrans = strcat(subDirPath, '/', sourceTransName, '.ply');
    sourceMarkerTrans = strcat(subDirPath, '/', sourceMarkerTransName, '.xyz');

    % targetBoundary = strcat(subDirPath, '/', targetName, '.bd');
    targetBoundary = strcat(subDirPath, '/../', targetName, '.bd');


    %% Step 1: Set markers
    cd(fullfile(basePath, workPath, subDirName));
    cmd = strjoin({fullfile(basePath, 'bin', 'ManualRegistration'), strcat('../', targetName, '.ply'), strcat(sourceName, '.ply')});
    system(cmd);
    cd(basePath);
    
end