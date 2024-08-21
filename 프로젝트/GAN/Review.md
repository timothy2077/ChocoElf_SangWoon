<aside>
🤔 피어리뷰 템플릿

- [o]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요? (완성도)**
    - 문제에서 요구하는 최종 결과물이 첨부되었는지 확인
    - 문제를 해결하는 완성된 코드란 프로젝트 루브릭 3개 중 2개, 
    퀘스트 문제 요구조건 등을 지칭
        - 해당 조건을 만족하는 부분의 코드 및 결과물을 캡쳐하여 사진으로 첨부

- [o]  **2. 프로젝트에서 핵심적인 부분에 대한 설명이 주석(닥스트링) 및 마크다운 형태로 잘 기록되어있나요? (설명)**
    - [o]  모델 선정 이유
    - [o]  하이퍼 파라미터 선정 이유
    - [o]  데이터 전처리 이유 또는 방법 설명

- [o]  **3. 체크리스트에 해당하는 항목들을 수행하였나요? (문제 해결)**
    - [o]  데이터를 분할하여 프로젝트를 진행했나요? (train, validation, test 데이터로 구분)
    - [o]  하이퍼파라미터를 변경해가며 여러 시도를 했나요? (learning rate, dropout rate, unit, batch size, epoch 등)
    - [o]  각 실험을 시각화하여 비교하였나요?
    - [o]  모든 실험 결과가 기록되었나요?

- [o]  **4. 프로젝트에 대한 회고가 상세히 기록 되어 있나요? (회고, 정리)**
    - [o]  배운 점
    - [o]  아쉬운 점
    - [o]  느낀 점
    - [o]  어려웠던 점

- [o]  **5.  앱으로 구현하였나요?**
    - [o]  구현된 앱이 잘 동작한다.
    - [o]  모델이 잘 동작한다.
</aside>

미세조정된 두 가지 모델과 앱 하나를 구현해주셨으며 GIF 이미지도 첨부해주셨다.
모델 성능은 개선중이시며 앱은 모델과 잘 연동되어 성공적으로 결과값을 출력함을 확인할 수 있었다. (출력값의 정확성은 모델 개선을 통해 이루어질 예정)

모델 하나(상운님):
* Dense를 더 추가
* Flatten은 연산량이 늚으로 global average pooling으로 변경 (위치 정보 유지)
기존 모델에서 성능과 연산량을 개선하는 방향으로 구현해주셨고, 학습시에 흑백으로 하면 연산량이 줄지 질문을 공유하며 연산량에 대해 나아가 탐구해주셨다.

모델 둘(기홍님):
* 노이즈인풋과 더불어 라벨인풋을 함께 학습시켜 110차원으로 학습을 진행
* 클래스 선택해서 사진을 볼 수 있는 앱으로 구현 (라벨과 이미지가 정확히 연결되는지는 확인 필요하신 상태)
* 어텐션 레이어를 구성해 추가
앱과 연동하는 시도와, 배웠던 어텐션 기능을 추가하셨고, 훈련 시간이 50에포크에 1시간반이 걸린다는 점을 공유해주시며 어텐션 레이어의 연산량을 다시 가늠해주셨다.

```
# 모델 하나: Dense 층이 추가되고 Flatten 대신 Global Average Pooling 층이 적용된 모델
def make_discriminator_model():
    model = tf.keras.Sequential()
    ...
    model.add(layers.Dropout(0.3))

    model.add(layers.GlobalAveragePooling2D())
    model.add(layers.Dense(256))
    model.add(layers.Dense(128))
    model.add(layers.Dense(1))

    return model

```

```
# 모델 둘: 라벨 학습
def make_generator_model():
    noise_input = layers.Input(shape=(100,))
    label_input = layers.Input(shape=(10,))
    
    x = layers.Concatenate()([noise_input, label_input])
...
    model = tf.keras.Model([noise_input, label_input], x)
    return model

```

```
# 모델 둘: 라벨 인풋 연결
def train_step(images, labels):
    ...
    
    # 원-핫 인코딩된 레이블 생성
    one_hot_labels = tf.one_hot(tf.squeeze(labels), depth=10)

    with tf.GradientTape() as gen_tape, tf.GradientTape() as disc_tape:
        generated_images = generator([noise, one_hot_labels], training=True)

        # 레이블을 이미지와 결합
        label_channels = tf.repeat(tf.expand_dims(one_hot_labels, axis=1), repeats=32, axis=1)
        label_channels = tf.repeat(tf.expand_dims(label_channels, axis=2), repeats=32, axis=2)
        
        real_input = tf.concat([images, label_channels], axis=3)
        fake_input = tf.concat([generated_images, label_channels], axis=3)
    ...
    return gen_loss, disc_loss
```

```
# 모델 둘: 어텐션 레이어
class SelfAttention(tf.keras.layers.Layer):
    def __init__(self, channels):
        super(SelfAttention, self).__init__()
        self.channels = channels
        self.mha = tf.keras.layers.MultiHeadAttention(num_heads=8, key_dim=channels)
        self.ln = tf.keras.layers.LayerNormalization()
        self.ff_conv1 = tf.keras.layers.Conv2D(channels, 1, activation='relu')
        self.ff_conv2 = tf.keras.layers.Conv2D(channels, 1)

    def call(self, x):
        ...
        return x + output

    def compute_output_shape(self, input_shape):
        return input_shape
```

```
# 모델 둘: 어텐션 레이어 적용
# Generator 모델 정의
def make_generator_model():
    model = tf.keras.Sequential()
    ...
    model.add(layers.Reshape((8, 8, 512)))
    ...
    model.add(layers.LeakyReLU())

    # Add Self-Attention layer
    model.add(SelfAttention(256))

    model.add(layers.Conv2DTranspose(128, (5, 5), strides=(2, 2), padding='same', use_bias=False))
    ...
    return model

# Discriminator 모델 정의
def make_discriminator_model():
    model = tf.keras.Sequential()
    ...
    model.add(layers.Dropout(0.3))
    
    # Add Self-Attention layer
    model.add(SelfAttention(128))
    
    model.add(layers.Conv2D(256, (5, 5), strides=(2, 2), padding='same'))
    ...
    
    return model

```
