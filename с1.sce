//начальные условия
x0 = 22022;//численность первой армии
y0 = 33033;//численность второй армии
t0 = 0;//начальный момент времени 
a = 0.343;//константа, характеризующая степень влияния различных факторов на потери
b = 0.895;//эффективность боевых действий армии у
c = 0.699;//эффективность боевых действий армии х
h = 0.433;//константа, характеризующая степень влияния различных факторов на потери
tmax = 1;//предельный момент времени +-
dt = 0.05;//шаг изменения времени +-
t = [t0:dt:tmax];
function p = P(t)//возможность подхода подкрепления к армии х 
p = 2*sin(2*t);
endfunction
function q = Q(t)//возможность подхода подкрепления к армии у 
q = 2*cos(t);
endfunction
//Система дифференциальных уравнений
function dy = syst(t, y)
dy(1) = - a*y(1) - b*y(2) + P(t);//изменение численности первой арми
dy(2) = - c*y(1)*y(2) - h*y(2) + Q(t);//изменение численности второйармии
endfunction
v0 = [x0;y0];//Вектор начальных условий
//Решение системы
y = ode(v0,t0,t,syst);
//Построение графиков решений
scf(0);
plot2d(t,y(1,:),style=2);//График изменения численности армии х(синий)
xtitle('Модель боевых действий № 2','Шаг','Численность армии');
plot2d(t,y(2,:), style = 5);//График изменения численности армии у(красный)
xgrid();
