package com.ksl.yardsales.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson(deepSerialize = true)
public class YardSale {

    @NotNull
    private String url;

    private String htmlDescription;

    private String plainTextDescription;

    private String approximateLocation;

    private String title;

    private String contactName;

    private String contactPhone;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date date;

    private int popularity;

    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "yardsales")
    private Set<Tag> tags = new HashSet<Tag>();
}
