package com.ksl.yardsales.repository;

import com.ksl.yardsales.domain.Address;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Address.class)
public interface AddressRepository {
}
