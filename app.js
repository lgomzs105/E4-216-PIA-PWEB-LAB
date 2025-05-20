const express = require('express');
const path = require('path');
const app = express();
const port = 3000;
const ubicacionRouter = require('./routers/ubicacion.routes');
const menuRouter = require('./routers/menu.routes');
const usersRouter = require('./routers/users.routes');
const user_opRouter = require('./routers/users_op.routes');

app.use(express.static(path.join(__dirname, 'public')));
app.use('/assets', express.static(path.join(__dirname, 'public')));
app.set('views', path.join(__dirname, 'Views'));
app.set('view engine', 'ejs');

app.use(usersRouter);

app.use(user_opRouter);

app.use(ubicacionRouter);

app.use(menuRouter)

app.listen(port, () => {
    console.log(`Servidor corriendo en el puerto http://localhost:${port}/`);
});