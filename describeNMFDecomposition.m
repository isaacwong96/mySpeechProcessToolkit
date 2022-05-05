function describeNMFDecomposition(V, W, H)
    [numFreq1, numTime1] = size(V);
    [numFreq2, numAtom2] = size(W);
    [numAtom3, numTime3] = size(H);
    
    disp('========================================');
    disp('Input V:');
    disp(['    V.shape = (numFreq, numWindows): (' ,num2str(numFreq1),', ',num2str(numTime1),')' ]);
    disp(['    V.dtype = ' ,class(V) ]);
    disp('Dictionary W:');
    disp(['    W.shape = (numFreq, numAtoms): (', num2str(numFreq2),', ', num2str(numAtom2),')']);
    disp(['    W.dtype = ' ,class(W) ]);
    disp('Coefficients H:');
    disp(['    H.shape = (numAtoms, numWindows): (' num2str(numAtom3),', ', num2str(numTime3),')']);
    disp(['    H.dtype = ' ,class(H) ]);