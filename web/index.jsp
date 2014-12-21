<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>



<%--<sql:query var="categories" dataSource="jdbc/affablebean">
    SELECT * FROM category
</sql:query>--%>

<div id="indexLeftColumn">
    <div id="welcomeText">
        <p style="font-size: larger"><fmt:message key='greeting'/></p>

        <fmt:message key='introText'/>
    </div>
</div>

<div id="indexRightColumn">
                <c:forEach var="category" items="${categories}">
                    <div class="categoryBox">
                        <a href="category?${category.id}">
                            <span class="categoryLabel"></span>
                            <span class="categoryLabelText"><fmt:message key='${category.name}'/></span>

                            <img src="${initParam.categoryImagePath}${category.name}.jpg"
                                         alt="<fmt:message key='${category.name}'/>" class="categoryImage">
                        </a>
                    </div>
                </c:forEach>


</div>

