package com.ksl.yardsales.domain;

import javax.validation.constraints.NotNull;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson(deepSerialize = true)
public class Address {

    @NotNull
    private String address;

    @NotNull
    private String city;

    @NotNull
    private String state;

    @NotNull
    private String zipcode;

    private Float latitude;

    private Float longitude;
}
