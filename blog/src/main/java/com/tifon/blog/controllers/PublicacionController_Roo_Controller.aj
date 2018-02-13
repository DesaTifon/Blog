// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.tifon.blog.controllers;

import com.tifon.blog.classes.Publicacion;
import com.tifon.blog.controllers.PublicacionController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect PublicacionController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String PublicacionController.create(@Valid Publicacion publicacion, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, publicacion);
            return "publicaciones/create";
        }
        uiModel.asMap().clear();
        publicacion.persist();
        return "redirect:/publicaciones/" + encodeUrlPathSegment(publicacion.getPublicacion_id().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String PublicacionController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Publicacion());
        return "publicaciones/create";
    }
    
    @RequestMapping(value = "/{publicacion_id}", produces = "text/html")
    public String PublicacionController.show(@PathVariable("publicacion_id") Integer publicacion_id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("publicacion", Publicacion.findPublicacion(publicacion_id));
        uiModel.addAttribute("itemId", publicacion_id);
        return "publicaciones/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String PublicacionController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("publicaciones", Publicacion.findPublicacionEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Publicacion.countPublicaciones() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("publicaciones", Publicacion.findAllPublicaciones(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "publicaciones/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String PublicacionController.update(@Valid Publicacion publicacion, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, publicacion);
            return "publicaciones/update";
        }
        uiModel.asMap().clear();
        publicacion.merge();
        return "redirect:/publicaciones/" + encodeUrlPathSegment(publicacion.getPublicacion_id().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{publicacion_id}", params = "form", produces = "text/html")
    public String PublicacionController.updateForm(@PathVariable("publicacion_id") Integer publicacion_id, Model uiModel) {
        populateEditForm(uiModel, Publicacion.findPublicacion(publicacion_id));
        return "publicaciones/update";
    }
    
    @RequestMapping(value = "/{publicacion_id}", method = RequestMethod.DELETE, produces = "text/html")
    public String PublicacionController.delete(@PathVariable("publicacion_id") Integer publicacion_id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Publicacion publicacion = Publicacion.findPublicacion(publicacion_id);
        publicacion.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/publicaciones";
    }
    
    void PublicacionController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("publicacion_fmodificacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("publicacion_fpublicacion_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void PublicacionController.populateEditForm(Model uiModel, Publicacion publicacion) {
        uiModel.addAttribute("publicacion", publicacion);
        addDateTimeFormatPatterns(uiModel);
    }
    
    String PublicacionController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
