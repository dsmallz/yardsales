// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ksl.yardsales.domain;

import com.ksl.yardsales.domain.YardSale;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect YardSale_Roo_Json {
    
    public String YardSale.toJson() {
        return new JSONSerializer().exclude("*.class").deepSerialize(this);
    }
    
    public static YardSale YardSale.fromJsonToYardSale(String json) {
        return new JSONDeserializer<YardSale>().use(null, YardSale.class).deserialize(json);
    }
    
    public static String YardSale.toJsonArray(Collection<YardSale> collection) {
        return new JSONSerializer().exclude("*.class").deepSerialize(collection);
    }
    
    public static Collection<YardSale> YardSale.fromJsonArrayToYardSales(String json) {
        return new JSONDeserializer<List<YardSale>>().use(null, ArrayList.class).use("values", YardSale.class).deserialize(json);
    }
    
}