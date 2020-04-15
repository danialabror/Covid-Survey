class SurveysController < ApplicationController
  def index
  end

  def start
    session.clear
    # @survey = Survey.new(params[:surveys])
    name = params[:name] 
    total = 21

    session[:current] ||= 1
    session[:yes] = 0
    session[:name] = name

    redirect_to :action => "question"
  end

  def question
    @questions = [
      '',
      'Saya pergi keluar rumah',
      'Saya menggunakan transportasi umum',
      'Saya idak pakai masker saat berkumpul dengan orang lain',
      'Saya berjabat tangan dengan orang lain',
      'Saya tidak membersihkan tangan sebelum pegang kemudi kendaraan',
      'Saya menyentuh benda yang di sentuh orang lain',
      'Saya tidak menjaga jarak 1,5 meter dengan orang lain ketika melakukan kegiatan diluar rumah',
      'Saya makan diluar rumah (warung/restaurant)',
      'Saya tidak minum air hangat, dan mencuci tangan dengan sabun setelah sampai di tujuan',
       'Saya berada di wilayah tempat pasien tertular',
       'Saya pasang hand sanitizer atau pencuci tangan di depan rumah',
       'Saya tidak mencuci tangan dengan sabun saat sampai rumah',
       'Saya tidak menyediakan tissue basah/antiseptik, handsanitizer, masker, dll untuk keluarga dirumah',
       'Saya tidak segera merendam pakaian bekas pakai dengan air hangat',
       'Saya tidak segera mandi setelah sampai dirumah',
       'Saya tidak mensosialisasikan check list penilaian resiko pribadi ini kepada keluarga dirumah',
       'Saya dalam sehari tidak kena cahaya matahari 15 menit',
       'Saya tidak olahraga minimal 30 menit sehari',
       'Saya jarang minum vitamin C & E, dan kurang tidur',
       'Usia saya diatas 60 tahun',
       'Saya mempunyai penyakit jantung/diabetes/gangguan pernafasan kronis'
    ]
    session[:name]
    session[:current]
    session[:yes]
    @total = 21

    if session[:current] >= @total
      redirect_to :action => "end"
      return
     end

     @question = @questions[session[:current]]

  end

  def answer
    session[:name]
    session[:current]
    total = 21

    pilihan = params[:choice]


    if pilihan == 'true'
      session[:yes] += 1
    end

    session[:current] += 1

    redirect_to :action => "question"
  end

  def end
    session[:yes]
    session[:name]
    
    if session[:yes] >= 15 
      @msg = "Resiko Tinggi"
    elsif session[:yes] >= 8
      @msg = "Resiko sedang"
    elsif session[:yes] < 8
      @msg = "Resiko rendah"
    end
  end

end
