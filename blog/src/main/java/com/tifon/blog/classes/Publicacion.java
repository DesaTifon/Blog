package com.tifon.blog.classes;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.plural.RooPlural;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

@RooJavaBean
@RooToString
@RooPlural("Publicaciones")
@RooJpaActiveRecord(identifierField = "publicacion_id", identifierType = Integer.class)
public class Publicacion {

    /**
     */
    @NotNull
    @Column(unique = true)
    private String titulo;

    /**
     */
    @NotNull
    @Size(max = 150)
    private String resumen;

    /**
     */
    @NotNull
    private String cuerpo;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date fmodificacion;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date fpublicacion;
}
