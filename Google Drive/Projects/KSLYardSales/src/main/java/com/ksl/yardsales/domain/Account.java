package com.ksl.yardsales.domain;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson(deepSerialize = true)
public class Account {

    @NotNull
    @Column(unique = true)
    @Size(min = 6)
    private String userName;

    @NotNull
    @Size(min = 6)
    private String password;

    @ManyToOne
    private Address address;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<YardSale> yardSales = new HashSet<YardSale>();
}
