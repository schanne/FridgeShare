<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib tagdir="/WEB-INF/tags/templates" prefix="template"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<template:base>
    <jsp:attribute name="title">
        <c:choose>
            <c:when test="${edit}">
                Aufgabe bearbeiten
            </c:when>
            <c:otherwise>
                Aufgabe anlegen
            </c:otherwise>
        </c:choose>
    </jsp:attribute>

    <jsp:attribute name="head">
        <link rel="stylesheet" href="<c:url value="/css/task_edit.css"/>" />
    </jsp:attribute>

    <jsp:attribute name="menu">
        <div class="menuitem">
            <a href="<c:url value="/app/kuehlschrank"/>">Kühlschrank</a>
        </div>
    </jsp:attribute>

    <jsp:attribute name="content">
        <form method="post" class="stacked">
            <div class="column">
                <%-- CSRF-Token --%>
                <input type="hidden" name="csrf_token" value="${csrf_token}">

                <%-- Eingabefelder --%>
                <label for="task_owner">Eigentümer:</label>
                <div class="side-by-side">
                <%--   <input type="text" name="task_owner" value="${produkt_form.values["task_owner"][0]}" readonly="readonly"> --%>
                </div>



                <label for="name">
                    Bezeichnung:
                    <span class="required">*</span>
                </label>
                <div class="side-by-side">
                    <input name="name" value="${produkt_form.name}"
                </div>
<br>
                <label for="type">
                    Kategorie:
                <span class="required">*</span>
                </label>
                 <div class="side-by-side">
                   <select name="type">
                            <c:forEach items="${produktKategorie}" var="produktKategorie">
                                <option value="${produktKategorie}" ${produkt_form.type == wasteType ? 'selected' : ''}>${produktKategorie.label}</option>
                            </c:forEach>
                        </select>
                    </div>
                <br>
                 <label for="menge">
                    Menge:
                    <span class="required">*</span>
                </label>
                <div class="side-by-side">
                    <input name="menge" type="number" value="${produkt_form.menge}" min="1">
                </div>
                <br>
                <%-- Button zum Abschicken --%>
                <div class="side-by-side">
                    <button class="icon-pencil" type="submit" name="action" value="save">
                        Sichern
                    </button>

                    <c:if test="${edit}">
                        <button class="icon-trash" type="submit" name="action" value="delete">
                            Löschen
                        </button>
                    </c:if>
                </div>
            </div>

            <%-- Fehlermeldungen --%>
            <c:if test="${!empty task_form.errors}">
                <ul class="errors">
                    <c:forEach items="${task_form.errors}" var="error">
                        <li>${error}</li>
                    </c:forEach>
                </ul>
            </c:if>
        </form>
    </jsp:attribute>
</template:base>