function res = getMaxTDOA(microphoneSeparationInMetres)
    SPEED_OF_SOUND_IN_METRES_PER_SECOND = 340.29;
    res = microphoneSeparationInMetres / SPEED_OF_SOUND_IN_METRES_PER_SECOND;