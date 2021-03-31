package com.file.service;

import java.io.IOException;

public interface UploadService {

	String read(String uploadFileLocation, String fileLocation, String path) throws IOException;


}
