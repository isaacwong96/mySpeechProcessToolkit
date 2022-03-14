function tdoasInSeconds = getTDOAsInSeconds(microphoneSeparationInMetres, numTDOAs)
    maxTDOA = getMaxTDOA(microphoneSeparationInMetres);
    tdoasInSeconds = linspace(-maxTDOA, maxTDOA, numTDOAs);