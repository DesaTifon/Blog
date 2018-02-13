// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.tifon.blog.classes;

import com.tifon.blog.classes.Publicacion;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Publicacion_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Publicacion.entityManager;
    
    public static final List<String> Publicacion.fieldNames4OrderClauseFilter = java.util.Arrays.asList("titulo", "resumen", "cuerpo", "fmodificacion", "fpublicacion");
    
    public static final EntityManager Publicacion.entityManager() {
        EntityManager em = new Publicacion().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Publicacion.countPublicaciones() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Publicacion o", Long.class).getSingleResult();
    }
    
    public static List<Publicacion> Publicacion.findAllPublicaciones() {
        return entityManager().createQuery("SELECT o FROM Publicacion o", Publicacion.class).getResultList();
    }
    
    public static List<Publicacion> Publicacion.findAllPublicaciones(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Publicacion o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Publicacion.class).getResultList();
    }
    
    public static Publicacion Publicacion.findPublicacion(Integer publicacion_id) {
        if (publicacion_id == null) return null;
        return entityManager().find(Publicacion.class, publicacion_id);
    }
    
    public static List<Publicacion> Publicacion.findPublicacionEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Publicacion o", Publicacion.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Publicacion> Publicacion.findPublicacionEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Publicacion o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Publicacion.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Publicacion.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Publicacion.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Publicacion attached = Publicacion.findPublicacion(this.publicacion_id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Publicacion.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Publicacion.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Publicacion Publicacion.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Publicacion merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
