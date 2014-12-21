           
<div id="singleColumn">

    <c:choose>
        <c:when test="${cart.numberOfItems > 1}">
            <p><fmt:message key='yourCartContains'/> ${cart.numberOfItems} <fmt:message key='items'/>.</p>
        </c:when>
        <c:when test="${cart.numberOfItems == 1}">
            <p><fmt:message key='yourCartContains'/> ${cart.numberOfItems} <fmt:message key='itemGenitive'/>.</p>
        </c:when>
        <c:otherwise>
            <p><fmt:message key='yourCartEmpty'/>.</p>
        </c:otherwise>
    </c:choose>

    <div id="actionBar">
        <%-- clear cart widget --%>
        <c:if test="${!empty cart && cart.numberOfItems != 0}">
            <a href="viewCart?clear=true" class="bubble hMargin"><fmt:message key='clearCart'/></a>
        </c:if>

        <%-- continue shopping widget --%>
        <c:set var="value">
            <c:choose>
                <%-- if 'selectedCategory' session object exists, send user to previously viewed category --%>
                <c:when test="${!empty selectedCategory}">
                    category
                </c:when>
                <%-- otherwise send user to welcome page --%>
                <c:otherwise>
                    index.jsp
                </c:otherwise>
            </c:choose>
        </c:set>

        <a href="${value}" class="bubble hMargin"><fmt:message key='continueShopping'/></a>

        <%-- checkout widget --%>
        <c:if test="${!empty cart && cart.numberOfItems != 0}">
            <a href="checkout" class="bubble hMargin"><fmt:message key='proceedCheckout'/></a>
        </c:if>
    </div>

    <c:if test="${!empty cart && cart.numberOfItems != 0}">

      <h4 id="subtotal"><fmt:message key='subtotal'/>: &euro; ${cart.subtotal}</h4>

      <table id="cartTable">

        <tr class="header">
            <th><fmt:message key='product'/></th>
            <th><fmt:message key='name'/></th>
            <th><fmt:message key='price'/></th>
            <th><fmt:message key='quantity'/></th>
        </tr>

        <c:forEach var="cartItem" items="${cart.items}" varStatus="iter">

          <c:set var="product" value="${cartItem.product}"/>

          <tr class="${((iter.index % 2) == 0) ? 'lightBlue' : 'white'}">
            <td>
              <img src="${initParam.productImagePath}${product.name}.png"
                   alt="${product.name}">
            </td>

            <td><fmt:message key='${product.name}'/></td>

            <td>
                &euro; ${cartItem.total}
                <br>
                <span class="smallText">( &euro; ${product.price} / <fmt:message key='unit'/> )</span>
            </td>

            <td>
                <form action="updateCart" method="post">
                    <input type="hidden"
                           name="productId"
                           value="${product.id}">
                    <input type="text"
                           maxlength="2"
                           size="2"
                           value="${cartItem.quantity}"
                           name="quantity"
                           style="margin:5px">
                    <input type="submit"
                           name="submit"
                           value=<fmt:message key='update'/> >
                </form>
            </td>
          </tr>

        </c:forEach>

      </table>

    </c:if>
</div>
