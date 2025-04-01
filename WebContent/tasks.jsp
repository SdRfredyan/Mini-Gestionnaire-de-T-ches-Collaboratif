
<%@ page import="java.util.*, com.example.Task" %>
<%
    List<Task> tasks = (List<Task>) session.getAttribute("tasks");
    if (tasks == null) {
        tasks = new ArrayList<>();
    }
%>
<!DOCTYPE html>
<html>
<head><title>Liste des tâches</title></head>
<body>
    <h2>Liste des tâches</h2>
    <ul>
    <% for (int i = 0; i < tasks.size(); i++) {
        Task t = tasks.get(i);
    %>
        <li>
            <strong><%= t.getTitle() %></strong> - <%= t.getDescription() %> (Échéance : <%= t.getDueDate() %>) 
            <% if (t.isCompleted()) { %><em>[Terminée]</em><% } %>
            <form action="task" method="post" style="display:inline;">
                <input type="hidden" name="index" value="<%= i %>"/>
                <input type="hidden" name="action" value="delete"/>
                <input type="submit" value="Supprimer"/>
            </form>
            <% if (!t.isCompleted()) { %>
            <form action="task" method="post" style="display:inline;">
                <input type="hidden" name="index" value="<%= i %>"/>
                <input type="hidden" name="action" value="complete"/>
                <input type="submit" value="Marquer comme terminée"/>
            </form>
            <% } %>
        </li>
    <% } %>
    </ul>
    <a href="index.jsp">Retour</a>
</body>
</html>
