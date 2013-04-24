package com.ksl.yardsales.domain;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
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
public class Tag {

    @NotNull
    @Size(min = 1, max = 25)
    private String tag;

    @NotNull
    @Size(max = 250)
    private String description;

    @ManyToMany(cascade = CascadeType.ALL)
    private Set<YardSale> yardsales = new HashSet<YardSale>();
}
