image ͼƬ������

use com\jdk5\blog\Image\Image;
require '../Image.php';

$img = new Image();

$watermark = array(
	"filename" => "watermarkater.png",	//ˮӡ�ļ�
	"position" => self::CENTER,	//ˮӡ��λ�ã��ֱ�Ϊ:center|top|left|bottom|right|top left|top right|bottom left|bottom right
	"opacity" => 1,	//ˮӡ��͸���ȣ�����Ϊ0-1��������ֵ��Ĭ��Ϊ1
	"x_offset" => 0,	//��ˮӡ��x��ƫ������Ĭ��Ϊ0
	"y_offset" => 0,	//��ˮӡ��y��ƫ������Ĭ��Ϊ0
	"angle" => self::WATERMARK_DIAGONAL_NEG	//ˮӡ����ת�Ƕȣ�����Ϊ-360-360�����ΪWATERMARK_DIAGONAL_POS��WATERMARK_DIAGONAL_NEG������������ͼƬ�ĶԽ�����ת��Ĭ��Ϊ0
);
$img->load('org.jpg')
	//->width(200)	//��������ͼƬ�Ŀ�ȣ��߶Ƚ����տ�ȵȱ�������
	//->height(200)	//��������ͼƬ�ĸ߶ȣ���Ƚ����ո߶ȵȱ�������
	->size(300, 300)	//��������ͼƬ�Ŀ�Ⱥ͸߶�
	->fixed_given_size(true)	//���ɵ�ͼƬ�Ƿ��Ը����Ŀ�Ⱥ͸߶�Ϊ׼
	->keep_ratio(true)		//�Ƿ񱣳�ԭͼƬ��ԭ����
	->bgcolor("#ffffff")	//���ñ�����ɫ������rgb��ʽ
	->rotate(20)	//ָ����ת�ĽǶ�
	->quality(50)	//��������ͼƬ������ 0-100��������ɵ�ͼƬ��ʽΪpng��ʽ������Խ��ѹ��Խ�������������ʽ����jpg��gif������ԽС��ѹ��Խ��
	->set_watermark($watermark)		//���ˮӡ
	->save('processed/org-width-resize.jpg');	//��������ͼƬ��·��



https://github.com/caipeiming/php-myutils