package com.file.serviceImpl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;

import org.springframework.stereotype.Service;

import com.file.service.UploadService;

@Service
public class UploadServiceImpl implements UploadService {

	public String fileName;
	/**
	 * Read.
	 *
	 * @param uploadFileLocation the upload file location
	 * @param fileLocation the file location
	 * @param pythonPath the python path
	 * @return the string
	 * @throws IOException Signals that an I/O exception has occurred.
	 */
	public String read(String uploadFileLocation, String fileLocation, String pythonPath) throws IOException {
		String pythonScriptPath = fileLocation;
		String sExt = "";
		String sData = "";

		String path = uploadFileLocation.replace('\\', '/');
		int index = pythonScriptPath.lastIndexOf("\\");
		fileName = pythonScriptPath.substring(index + 1);
		sExt = fileName.substring(fileName.lastIndexOf("."));
		String newFilename = "";
		if (fileName.indexOf(".") > 0)
			newFilename = fileName.substring(0, fileName.lastIndexOf("."));

		String result = "";
		if (sExt.equals(".step") || sExt.equals(".stp") || sExt.equals(".STEP") || sExt.equals(".STP")) {
			sData = "from OCC.STEPControl import STEPControl_Reader\n" + "from OCC.StlAPI import StlAPI_Writer\n"
					+ "from OCC.BRepMesh import BRepMesh_IncrementalMesh\n" + "step_Reader = STEPControl_Reader()\n"
					+ "step_Reader.ReadFile('" + path + fileName + "')\n" + "step_Reader.TransferRoot()\n"
					+ "stepShape = step_Reader.Shape()\n"
					+ "mesh = BRepMesh_IncrementalMesh(stepShape, 0.08, True, 0.07, True)\n"
					+ "stl_writer = StlAPI_Writer()\n" + "stl_writer.SetASCIIMode(False)\n"
					+ "stl_writer.Write(stepShape, '" + path + newFilename + ".stl" + "')\n" + "print('done')";

			result = processFile(uploadFileLocation, newFilename, sData, pythonPath);
		} else if (sExt.equals(".iges") || sExt.equals(".igs") || sExt.equals(".IGS") || sExt.equals(".IGES")) {
			sData = "from OCC.IGESControl import IGESControl_Reader \n" + "from OCC.StlAPI import StlAPI_Writer\n"
					+ "from OCC.BRepMesh import BRepMesh_IncrementalMesh\n"
					+ "from OCC.STEPControl import STEPControl_Reader\n" + "iges_Reader = IGESControl_Reader()\n"
					+ "iges_Reader.ReadFile('" + path + fileName + "')\n" + "iges_Reader.TransferRoots()\n"
					+ "igesTopoShape = iges_Reader.OneShape()\n"
					+ "mesh = BRepMesh_IncrementalMesh(igesTopoShape, 0.08, True, 0.07, True)\n"
					+ "stl_writer = StlAPI_Writer()\n" + "stl_writer.SetASCIIMode(False)\n"
					+ "stl_writer.Write(igesTopoShape, '" + path + newFilename + ".stl" + "')\n" + "print('done')";

			result = processFile(uploadFileLocation, newFilename, sData, pythonPath);
		} else if (sExt.equals(".stl") || sExt.equals(".STL")) {
			result = fileName;
		}else if (sExt.equals(".obj") || sExt.equals(".OBJ")) {
			result = fileName;
		}
		return result;
	}

	private String processFile(String uploadFileLocation, String newFilename, String sData, String pythonPath) throws IOException {
		String sPyFile = uploadFileLocation + newFilename + ".py";
		String[] cmd = new String[2];

		File myFile = new File(sPyFile);
		myFile.createNewFile(); // if file already exists will do nothing
		FileOutputStream oFile = new FileOutputStream(myFile, false);

		oFile.write(sData.getBytes());
		oFile.close();

		String scadFile = uploadFileLocation + fileName;
		scadFile = scadFile.replace('\\', '/');

		
		  cmd[0] = pythonPath; // check version of installed python: python -V
		 		
		/*
		 * cmd[0] = "python"; // check version of installed python: python -V
		 */		cmd[1] = sPyFile;

		// create runtime to execute external command
		Runtime rt = Runtime.getRuntime();
		Process pr = rt.exec(cmd);
		System.out.println("pr:" + pr);
		System.out.println("pr:" + pr.getInputStream());

		BufferedReader bfr1 = new BufferedReader(new InputStreamReader(pr.getErrorStream()));
		String Error = bfr1.readLine();
		System.out.println("Error:" + Error);
		// retrieve output from python script
		BufferedReader bfr = new BufferedReader(new InputStreamReader(pr.getInputStream()));
		String outputPython;
		String output = "";
		while ((outputPython = bfr.readLine()) != null) {
			output = outputPython;
		}
		System.out.println("OUTPUT:" + output);

		return newFilename;

	}



}