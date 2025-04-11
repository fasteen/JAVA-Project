package com.menu.model;

import java.sql.Timestamp;
import java.util.UUID;

public class Order {
    private String id;
    private String address;
    private String paymentMethod;
    private String status;
    private Timestamp orderTime;

    public Order(String address, String paymentMethod) {
        this.id = UUID.randomUUID().toString();
        this.address = address;
        this.paymentMethod = paymentMethod;
        this.status = "Pending";
        this.orderTime = new Timestamp(System.currentTimeMillis());
    }

    public String getId() { return id; }
    public String getAddress() { return address; }
    public String getPaymentMethod() { return paymentMethod; }
    public String getStatus() { return status; }
    public Timestamp getOrderTime() { return orderTime; }
}
