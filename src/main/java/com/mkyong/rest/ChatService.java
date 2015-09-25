/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mkyong.rest;

/**
 *
 * @author WKKFERNANDO
 */
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.alicebot.ab.*;

@Path("/chat")
public class ChatService {

    @GET
    @Path("/{param}")
    public Response ProcessMsg(@PathParam("param") String msg) {
//        System.out.println("processMSG");
//        String botname = "super";
//        String dep_path = ChatService.class.getResource("/programab").toString();
//        String  f_dep_path=dep_path+'\b';
//        System.out.println("path:" + dep_path);
//        System.out.println("f_dep_path:"+f_dep_path);
//       
//        Bot bot = new Bot(botname,f_dep_path);
//        Chat chat = new Chat(bot);
//        String response = chat.multisentenceRespond(msg);
//        return Response.status(200).entity("Bot~" + response).build();

        System.out.println("A");
        String botname = "super";
        URL url = ChatService.class.getResource("/programab");
        Bot bot = new Bot(botname, url.getPath());
        Chat chat = new Chat(bot);
        String response = chat.multisentenceRespond(msg);
        return Response.status(200).entity("Bot~" + response).build();
    }

}
