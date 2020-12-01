#we chose alpine because in the docker world alpine is compact and small
FROM node:alpine

#this is our work directory, because we don't wanna overwrite any files
WORKDIR /usr/app
#the reason we only copied package.json file because, 
#we don't wanna run npm install if we have made changes only in the index.js file
COPY ./package.json ./

RUN npm install

#we copy everything to the container FS snapshot
COPY ./ ./

#setting the defult command of our generated image
CMD ["npm","start"]


#docker build -t dantedxwolf/simpleweb:latest .
#docker run -p 3000:4000 dantedxwolf/simpleweb:latest
#in the browser, run "192.168.99.100:4000"
#as I am using Docker toolbox, localhost will not work here