package org.acme;

import io.micrometer.core.annotation.Timed;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/hello")
public class ExampleResource {

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    @Timed(value = "hello_request",
        percentiles = {0.5, 0.75, 0.95, 0.98, 0.99, 0.999})
    public String hello() {
        return "hello";
    }
}