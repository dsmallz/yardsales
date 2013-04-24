package com.ksl.yardsales.repository;

import com.ksl.yardsales.domain.ContactInfo;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = ContactInfo.class)
public interface ContactInfoRepository {
}
