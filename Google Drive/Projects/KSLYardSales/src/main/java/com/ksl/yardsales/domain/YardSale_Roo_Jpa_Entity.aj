// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ksl.yardsales.domain;

import com.ksl.yardsales.domain.YardSale;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect YardSale_Roo_Jpa_Entity {
    
    declare @type: YardSale: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long YardSale.id;
    
    @Version
    @Column(name = "version")
    private Integer YardSale.version;
    
    public Long YardSale.getId() {
        return this.id;
    }
    
    public void YardSale.setId(Long id) {
        this.id = id;
    }
    
    public Integer YardSale.getVersion() {
        return this.version;
    }
    
    public void YardSale.setVersion(Integer version) {
        this.version = version;
    }
    
}
