package com.AllInSmall.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.AllInSmall.demo.model.Category;
import com.AllInSmall.demo.model.Product;
import com.AllInSmall.demo.repository.CategoryRepository;
import com.AllInSmall.demo.repository.ProductRepository;

import org.springframework.ui.Model;

@Controller
@RequestMapping("/")
public class HomeController {

	@Autowired
	private CategoryRepository categoryRepository;

	@Autowired
	private ProductRepository productRespository;

	@GetMapping()
	public String getAllCategories(@RequestParam(required = false) Integer categoryId,
			@RequestParam(required = false) String action, Model model) {
		List<Category> categories = categoryRepository.findAll();
		List<Product> products;

		if ("SHOW_PRODUCT_BY_CATEGORY".equals(action) && categoryId != 0) {
            products = productRespository.findProductByCategoryId(categoryId);
        }  else if (("SHOW_ALL").equals(action)) {
			products = productRespository.findAll();
		} else {
			products = productRespository.findAll();
		}
		model.addAttribute("allCategory", categories);
		model.addAttribute("products", products);
//		System.out.println(categories);
		return "index";
	}
	
	
}
