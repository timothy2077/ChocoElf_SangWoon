<aside>
🤔 피어리뷰 템플릿

- [O]  **1. 주어진 문제를 해결하는 완성된 코드가 제출되었나요? (완성도)**
    - 문제에서 요구하는 최종 결과물이 첨부되었는지 확인 (잘 출력되었습니다)
    - 문제를 해결하는 완성된 코드란 프로젝트 루브릭 3개 중 2개, 퀘스트 문제 요구조건 등을 지칭
    - 해당 조건을 만족하는 부분의 코드 및 결과물을 캡쳐하여 사진으로 첨부 (하기 코드와 첨부된 이미지 참조)
      
# Edge Detection과 Openpose, 2개의 전처리기를 controlnets라는 리스트로 만듭니다.
edge_detection = ControlNetModel.from_pretrained("lllyasviel/sd-controlnet-canny", torch_dtype=torch.float16)
openpose = ControlNetModel.from_pretrained("lllyasviel/sd-controlnet-openpose", torch_dtype=torch.float16)
controlnets = [edge_detection, openpose]

# 리스트 controlnets를 파이프라인으로 전달합니다.
pipe = StableDiffusionControlNetPipeline.from_pretrained(
    "runwayml/stable-diffusion-v1-5", controlnet=controlnets, torch_dtype=torch.float16
)

pipe.scheduler = UniPCMultistepScheduler.from_config(pipe.scheduler.config)
pipe = pipe.to("cuda")
     
![image](https://github.com/user-attachments/assets/05a2e3b4-69c7-41c3-83d4-b8142c146d03)


- [O]  **2. 프로젝트에서 핵심적인 부분에 대한 설명이 주석(닥스트링) 및 마크다운 형태로 잘 기록되어있나요? (설명)**
    - [O]  모델 선정 이유
    - [O]  하이퍼 파라미터 선정 이유
    - [O]  데이터 전처리 이유 또는 방법 설명
      
(모든 핵심 코드들에 주석들이 마크다운 형태로 잘 작성되어 있습니다)
      
# 인체 감지 포즈를 넣어줄 가운데 부분을 지워줍니다.
zero_start = canny_image.shape[1] // 4
zero_end = zero_start + canny_image.shape[1] // 2
canny_image[:, zero_start:zero_end] = 0

# 윤곽선을 검출하고 NumPy 배열을 PIL 이미지로 변환합니다.
canny_image = cv2.Canny(canny_image, low_threshold, high_threshold)
canny_image = canny_image[:, :, None]
canny_image = np.concatenate([canny_image, canny_image, canny_image], axis=2)
canny_image = Image.fromarray(canny_image)

- [O]  **3. 체크리스트에 해당하는 항목들을 수행하였나요? (문제 해결)**
    - [X]  데이터를 분할하여 프로젝트를 진행했나요? (train, validation, test 데이터로 구분): 이번 ControlNet과 Stable Diffusion 프로젝트와 관련없음
    - [X]  하이퍼파라미터를 변경해가며 여러 시도를 했나요? (learning rate, dropout rate, unit, batch size, epoch 등): 이번 ControlNet과 Stable Diffusion 프로젝트와 관련없음
    - [O]  각 실험을 시각화하여 비교하였나요? 프로젝트에 요구되어진 각 프로세스를 잘 이행하였습니다. 
    - [O]  모든 실험 결과가 기록되었나요? 출력된 결과물들을 통해 명확히 확인할 수 있었습니다. 

- [O]  **4. 프로젝트에 대한 회고가 상세히 기록 되어 있나요? (회고, 정리)**
    - [O]  배운 점
    - [O]  아쉬운 점
    - [O]  느낀 점
    - [O]  어려웠던 점
           
일단 메모리를 너무 잡아 먹어서 개선이고 자시고 할 메모리가 없다.
LMS에서 제대로 되지 않아 코렙으로 가져왔는데 메모리가 엄청 빨리단다. 그래서
일단 그냥 한 번 해보는 걸로 만족하고 넘어가야 겠다. 느낀점은 코드를 가져다
쓰는 것은 쉽지만 이해하고 설계하는 것에는 어려움이 많다는 것이고 어려운
점은 메모리가 어렵다!?!?!? 아무튼 좋은 경험이었던 것 같다.

- [X]  **5.  앱으로 구현하였나요?**
    - [X]  구현된 앱이 잘 동작한다.
    - [X]  모델이 잘 동작한다.
</aside>
