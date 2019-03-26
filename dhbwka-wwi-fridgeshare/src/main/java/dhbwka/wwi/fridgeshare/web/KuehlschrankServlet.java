/*
 * Copyright © 2018 Dennis Schulmeister-Zimolong
 * 
 * E-Mail: dhbw@windows3.de
 * Webseite: https://www.wpvs.de/
 * 
 * Dieser Quellcode ist lizenziert unter einer
 * Creative Commons Namensnennung 4.0 International Lizenz.
 */
package dhbwka.wwi.fridgeshare.web;

import dhbwka.wwi.fridgeshare.common.ejb.ProduktBean;
import dhbwka.wwi.fridgeshare.common.ejb.UserBean;
import dhbwka.wwi.fridgeshare.common.jpa.User;
import dhbwka.wwi.fridgeshare.jpa.Produkt;
import dhbwka.wwi.fridgeshare.jpa.ProduktKategorie;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Startseite: Zeigt eine Übersicht der vorhandenen Textschnippsel sowie einen
 * Link zum Anlegen neuer Schnippsel.
 */
@WebServlet(urlPatterns="/app/kuehlschrank")
public class KuehlschrankServlet extends HttpServlet {
    
    public static final String URL = "/app/kuehlschrank";
    
    @EJB
    UserBean userBean;
    
    @EJB
    ProduktBean produktBean;
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
        request.setAttribute("ProduktKategorie", ProduktKategorie.values());
        
        // Vorhandene Schnippsel einlesen und im Request Context ablegen
       List<Produkt> alleProdukte = this.produktBean.findAllProducts();
       request.setAttribute("alleProdukte", alleProdukte);
       
       User user = this.userBean.getCurrentUser();
       request.setAttribute("user", user);
       
        
        // Anfrage an die index.jsp weiterleiten
        request.getRequestDispatcher("/WEB-INF/kuehlschrank.jsp").forward(request, response);
    }
    
}