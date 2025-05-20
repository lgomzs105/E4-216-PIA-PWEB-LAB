// routes/reserva.routes.js
import express from 'express';
const router = express.Router();

router.get('/reserva', (req, res) => {
  res.render('reserva'); // Asegúrate de tener views/reserva.ejs
});

export default router;