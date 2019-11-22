X = randn(300,2)*0.6+1;
X2 = randn(300,2)*0.5-1;
X3 = randn(300,2)*0.4+2;
data = [X; X2; X3];
plot(data(:,1),data(:,2),'o')
[s m] = size(data);
k = 3;
centroides = data(randi([1 900],1,k),:);
grupos = [];
for i=1:100
    distancesByGroup = [];
    for j=1:s
        distance = [];
        for z=1:k
            distance = [distance; norm(data(j,:)-centroides(z,:),2)];
        end
        [M,I] = min(distance);
        distancesByGroup = [distancesByGroup; I, M, data(j,:)];
    end
    for z=1:k
        idx = find(distancesByGroup(:,1) == z);
        sortedData = sortrows(distancesByGroup(idx,:));
        [tam l] = size(sortedData);
        mediana = int32(tam/2);
        centroides(z,:) = sortedData(mediana,3:4);
    end
end
colors = ["or","ob","og"];
figure;
hold on;
for i=1:k
    idx = find(distancesByGroup(:,1) == i);

    plot(distancesByGroup(idx,3),distancesByGroup(idx,4),colors(:,i));
end
