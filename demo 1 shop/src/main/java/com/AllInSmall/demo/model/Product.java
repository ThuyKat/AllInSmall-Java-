package com.AllInSmall.demo.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="products")
public class Product {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int id;

@ManyToOne
@JsonBackReference
@JoinColumn(name = "category_id")
private Category category;


private String name;


private float price;

@OneToMany(mappedBy = "product") // name of object product in OrderDetail
@JsonManagedReference
private List<OrderDetail>orderDetails;


}
