package com.file.listener;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.annotation.WebListener;

import org.springframework.web.context.ContextLoaderListener;

@WebListener
public class FileLocationContextListener extends ContextLoaderListener {

	public void contextInitialized(ServletContextEvent servletContextEvent) {
		String rootPath = System.getProperty("catalina.home");
    	ServletContext ctx = servletContextEvent.getServletContext();
    	
    	
    	String relativePathFiles = ctx.getInitParameter("Rapidquote_FS.dir");
    	File file1 = new File(rootPath + File.separator + relativePathFiles);
    	if(!file1.exists())
    		file1.mkdirs();
    	System.out.println("File Directory created to be used for storing files");
    	ctx.setAttribute("FILES_DIR", file1);
    	//ctx.setAttribute("FILES_DIR", rootPath + File.separator + relativePath);
    	
    	String relativePathImages = ctx.getInitParameter("Rapidquote_MI.dir");
    	File file2 = new File(rootPath + File.separator + relativePathImages);
    	if(!file2.exists())
    		file2.mkdirs();
    	System.out.println("File Directory created to be used for storing files");
    	ctx.setAttribute("FILESIMG_DIR", file2);
    	
    	String relativePathPartCapture = ctx.getInitParameter("Rapidquote_PCF.dir");
    	File file3 = new File(rootPath + File.separator + relativePathPartCapture);
    	if(!file3.exists()) 
    		file3.mkdirs();
    	System.out.println("File Directory created to be used for storing files");
    	ctx.setAttribute("FILESPCF_DIR", file3);
    	

		String relativePathAttachment = ctx.getInitParameter("Rapidquote_AF.dir");
		File file4 = new File(rootPath + File.separator + relativePathAttachment);
		if (!file4.exists())
			file4.mkdirs();
		System.out.println("File Directory created to be used for storing files");
		ctx.setAttribute("FILESAF_DIR", file4);
    	
    	String relativePathQuote = ctx.getInitParameter("Rapidquote_QF.dir");
    	File file5 = new File(rootPath + File.separator + relativePathQuote);
    	if(!file4.exists()) 
    		file4.mkdirs();
    	System.out.println("File Directory created to be used for storing files");
    	ctx.setAttribute("FILESQF_DIR", file5);
		
	}

	public void contextDestroyed(ServletContextEvent servletContextEvent) {
		
		
	}

  
	
}
