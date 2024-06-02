package com.AllInSmall.demo.model;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Table(name="orders")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {

@Id
@GeneratedValue(strategy= GenerationType.IDENTITY)
private int id;

@Column(name="user_id")
private int userId;

private enum status{placed, completed, ready};

private Date date;

@Column(name="total_Price")
private float totalPrice;

@OneToMany(mappedBy ="order") //name of object Order in OrderDetail
@JsonManagedReference
private List<OrderDetail> orderDetails;


}