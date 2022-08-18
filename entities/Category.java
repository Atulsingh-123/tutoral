
package com.mycompany.e_commerse.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.OneToMany;


@Entity
public class Category {
    
    @Id 
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int categoryId;
    private String categoryTital;
    private String categoryDescription;
    
    @OneToMany(mappedBy = "category")
    private List<Product> products = new ArrayList<>();

    public Category(int categoryId, String categoryTital, String categoryDescription) {
        this.categoryId = categoryId;
        this.categoryTital = categoryTital;
        this.categoryDescription = categoryDescription;
    }

    public Category(String categoryTital, String categoryDescription, List<Product> products) {
        this.categoryTital = categoryTital;
        this.categoryDescription = categoryDescription;
        this.products = products;
    }

    public Category() {
    }
    
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryTital() {
        return categoryTital;
    }

    public void setCategoryTital(String categoryTital) {
        this.categoryTital = categoryTital;
    }

    public String getCategoryDescription() {
        return categoryDescription;
    }

    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    
    
    
    @Override
    public String toString() {
        return "Category{" + "categoryId=" + categoryId + ", categoryTital=" + categoryTital + ", categoryDescription=" + categoryDescription + '}';
    }
      
}
