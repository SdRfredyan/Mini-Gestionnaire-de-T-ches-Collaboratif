
<!DOCTYPE html>
<html>
<head><title>Ajouter une tâche</title></head>
<body>
    <h2>Ajouter une tâche</h2>
    <form action="task" method="post">
        <input type="hidden" name="action" value="add"/>
        Titre: <input type="text" name="title"/><br/>
        Description: <textarea name="description"></textarea><br/>
        Date d’échéance: <input type="date" name="dueDate"/><br/>
        <input type="submit" value="Ajouter"/>
    </form>
    <a href="index.jsp">Retour</a>
</body>
</html>
