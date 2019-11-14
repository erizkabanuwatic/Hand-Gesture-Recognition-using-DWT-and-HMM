function plotHistogram(idx, obsLength, filesPerClass, nClasses)

% Plot classwise histogram
datapointsInEachClass = sum(reshape(obsLength,[filesPerClass nClasses]));
prev = 0;
for i = 1:nClasses
    data(i).vals = idx(prev+1:prev + datapointsInEachClass(i));
    prev = datapointsInEachClass(i);
end
figure;
subplot(3,2,1)
histogram(data(1).vals)
title('A')
hold on
subplot(3,2,3)
histogram(data(2).vals)
title('B')

subplot(3,2,5)
histogram(data(3).vals)
title('C')

subplot(3,2,2)
histogram(data(4).vals)
title('Point')

subplot(3,2,4)
histogram(data(5).vals)
title('Five')



end

