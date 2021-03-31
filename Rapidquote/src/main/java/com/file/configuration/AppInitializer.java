package com.file.configuration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import com.file.filter.SessionFilter;
import com.file.listener.SessionListener;


public class AppInitializer implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		
		AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();

		ctx.register(AppConfig.class);
		ctx.setServletContext(servletContext);
		servletContext.addListener(new ContextLoaderListener(ctx));
		ServletRegistration.Dynamic servlet = servletContext.addServlet("dispatcher", new DispatcherServlet(ctx));
		servlet.setLoadOnStartup(1);
		
		servlet.addMapping("/");
		servletContext.setInitParameter("Rapidquote_FS.dir", "Rapidquote_FS/partFiles");
		servletContext.setInitParameter("Rapidquote_MI.dir", "Rapidquote_FS/materialImages");
		servletContext.setInitParameter("Rapidquote_PCF.dir", "Rapidquote_FS/partCaptureFiles");
		servletContext.setInitParameter("Rapidquote_AF.dir", "Rapidquote_FS/AttachmentFiles");
		servletContext.setInitParameter("Rapidquote_QF.dir", "Rapidquote_FS/quoteFiles");
		servletContext.addFilter("sessionFilter", SessionFilter.class).addMappingForUrlPatterns(null, false,
				"/upload/*");
		servletContext.addListener(new SessionListener());
		/*servletContext.addListener("FileLocationContextListener");*/
	}

}
