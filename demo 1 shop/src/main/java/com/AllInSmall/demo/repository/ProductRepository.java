package com.AllInSmall.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.AllInSmall.demo.model.Category;
import com.AllInSmall.demo.model.Product;


public interface ProductRepository extends JpaRepository<Product,Long> {

	List<Product> findProductByCategoryId(Integer categoryId);
	
}
	