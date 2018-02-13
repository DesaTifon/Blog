package com.tifon.blog.classes;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.persistence.Column;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierField = "usuario_id", identifierType = Integer.class)
public class Usuario {

    /**
     */
    @NotNull
    @Size(min = 2, max = 20)
    private String nombre;

    /**
     */
    @NotNull
    @Size(min = 2, max = 20)
    private String apellido;

    /**
     */
    @NotNull
    @Column(unique = true)
    @Size(min = 2, max = 30)
    private String email;
}
