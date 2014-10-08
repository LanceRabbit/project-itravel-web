package model.service;

import javax.ws.rs.ApplicationPath;

import org.glassfish.jersey.server.ResourceConfig;

@ApplicationPath("/services")
public class RESTfulServiceConfig  extends ResourceConfig {
	public RESTfulServiceConfig () {
		packages("model.service.SearchSpotService");
	}
}
