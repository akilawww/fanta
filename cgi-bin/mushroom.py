from keras.models import Sequential
from keras.layers import Activation, Dense
from keras.layers import Conv2D, MaxPooling2D, Flatten

def main():
        model = Sequential()
        model.add(Conv2D(64, (3, 3), input_shape=(64, 64, 3)))
        model.add(Activation("relu"))
        model.add(MaxPooling2D(pool_size=(2, 2)))
        model.add(Conv2D(64, (3, 3)))
        model.add(Activation("relu"))
        model.add(MaxPooling2D(pool_size=(2, 2)))
        model.add(Flatten())
        model.add(Dense(256))
        model.add(Activation("relu"))
        model.add(Dense(2))
        model.add(Activation("softmax"))
        # model.summary()
        model.compile(
                optimizer="adam",
                loss="categorical_crossentropy",
                metrics=["accuracy"]
        )

if __name__ == "__main__":
        main()