package com.tifon.blog.controllers;
import com.tifon.blog.classes.Publicacion;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/publicaciones")
@Controller
@RooWebScaffold(path = "publicaciones", formBackingObject = Publicacion.class)
public class PublicacionController {
}
