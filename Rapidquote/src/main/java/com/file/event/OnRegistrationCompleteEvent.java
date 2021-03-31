package com.file.event;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationEvent;

import com.file.entities.User;

@SuppressWarnings("serial")
public class OnRegistrationCompleteEvent extends ApplicationEvent {

    private final String appUrl;
    private final Locale locale;
    private final User user;
    private final HttpServletRequest request;

    public OnRegistrationCompleteEvent(HttpServletRequest request, final User user, final Locale locale, final String appUrl) {
        super(user);
        this.user = user;
        this.request = request;
        this.locale = locale;
        this.appUrl = appUrl;
    }

    public String getAppUrl() {
        return appUrl;
    }

    public Locale getLocale() {
        return locale;
    }

    public User getUser() {
        return user;
    }

	public HttpServletRequest getRequest() {
		return request;
	}

    
}
